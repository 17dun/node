package com.example.xiaoting;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity implements OnClickListener {
	FirstAdapter adapter;

	ListView listView;
	TextView footView;
	String strjson="";

	private final int TIME_UP = 1;
	private final int TIME_UP2 = 2;
	
	private Handler handler = new Handler()
	{
		public void handleMessage(Message msg)
		{
			if(msg.what == TIME_UP)
			{
				//handler里面的方法是运行在主线程的
				List<Person> data = getDataByJson(strjson);
				adapter = new FirstAdapter(getApplicationContext(), data);
				adapter.setListView(listView);
				listView.setAdapter(adapter);
				footView = new TextView(getApplicationContext());
				footView.setText("加载更多");
				footView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
				footView.setGravity(Gravity.CENTER);
				footView.setOnClickListener(MainActivity.this);//如果这里再写this就是指handler，这里需要指向MainActivity的this
				listView.addFooterView(footView);
				listView.setOnItemClickListener(new OnItemClickListener() {// 为listView的每个item创建点击事件
					@Override
					public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
							long arg3) {// arg0 代表listview arg1,代表的是当前你点击的这一个条目的view
										// arg2代表点击的位置，就是position，是第几个条目
										// arg3代表id，也就是adapter里getIitemId（position）方法里返回的那个值

						Intent intent = new Intent(getApplicationContext(),
								SecondActivity.class);// 实例化一个调转页面
						intent.putExtra("name", adapter.getItem(arg2).getName());// 传参
						intent.putExtra("id", arg3);
						startActivity(intent);// 跳转

					}
				});
			}else if(msg.what== TIME_UP2){
				List<Person> data = getDataByJson(strjson);
				adapter.addData(data);
			}
		}
	};
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		listView = (ListView) findViewById(R.id.listView);
		new Thread(new Runnable() {//刚才那个错的意思是在主线程发起了网络请求，android4.0之后对网络访问做了限制，默认情况下网络访问不能放在主线程里，不然会报错

			@Override
			public void run() {
				try {
					strjson = JSONProvider.getJSONData("http://192.168.1.103:888/?method=getUserList");
					/*android手机就相当于一个小linux系统
					写127.0.0.1，相当于请求到系统自己的地址了，但系统这个地址又不对外提供服务，就refused了*/
					Log.i("strjson", strjson);
				} catch (IOException e) {
					e.printStackTrace();
				}
				Message msg = new Message();
				msg.what = TIME_UP;
				handler.sendMessage(msg);
			}//我本地也连接的代理
		}).start();
	}
	
	static class FirstAdapter extends BaseAdapter {// 一般情况下，使用listview，gridview,gallery等，都学要自定义一个数据适配器，并继承BaseAdaper,有些直接从数据库取数据展示的，可能会用到SimpleCursorAdapter，不过一般用的少，继承BaseAdapter的比较多
		private Context context;
		private List<Person> dataList;
		private ListView listView;

		public FirstAdapter(Context context, List<Person> dataList) {
			this.context = context;
			this.dataList = dataList;
		}
		public void setListView(ListView listView){
			this.listView = listView;
		}
		@Override
		public int getCount() {// 这个方法用来告诉listview一共有多少数据
			return dataList.size();
		}

		@Override
		public Person getItem(int arg0) {// 这个方法返回特定位置的数据

			return dataList.get(arg0);
		}

		@Override
		public long getItemId(int arg0) {// 这个方法返回特定位置数据的id，一般直接返回位置即可，如果是从数据库取的数据，如用了simpleCursorAdapter等的话，这里返回的是数据库的主键ID

			return dataList.get(arg0).getId();
		}

		public void addData(Person tx) {
			dataList.add(tx);
			notifyDataSetChanged();
		}

		public void addData(List<Person> datas) {
			dataList.addAll(datas);
			notifyDataSetChanged();
		}

		@Override
		public View getView(int arg0, View arg1, ViewGroup arg2) {// 适配器的主要功能，在这里初始化数据
			if (arg1 == null) {
				// arg1 = new TextView(context);
				arg1 = View.inflate(context, R.layout.listitem_demo, null);// 把一个xml文件解析成一个view对象，最后一个参数标示 父类
			}
			TextView tv = (TextView) arg1.findViewById(R.id.tvName);
			ImageView ivHeader = (ImageView) arg1.findViewById(R.id.ivHeader);
			Person p = getItem(arg0);
			tv.setText(p.getName());
			tv.setTextColor(0xff3b0000);//名称的文字颜色
			tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
			String url = p.getPic();
			ivHeader.setTag(arg1+url);
			new DownloadBitmapTask(listView, arg1+url).execute(url);
			return arg1;
		}

	}
	static class DownloadBitmapTask extends AsyncTask<String, Void, Bitmap>{//AsyncTask是android里的一个异步加载类
		ListView listView;
		private String tag = null;
		public DownloadBitmapTask(ListView listView,String tag) {
			this.listView = listView;
			this.tag = tag;
		}

		@Override
		protected Bitmap doInBackground(String... arg0) {//String...arg0   表示可以接收不限个数的String 嗯  程序里就把他当数组取就可以了
			//doinBackground这个方法是运行在后台线程里的
			String url = arg0[0];
			Bitmap bmp = returnBitMap(url);
			return bmp;
		}
		@Override
		protected void onPostExecute(Bitmap result) {//这个方法是运行在主线程的，他的参数就是diInBackground方法的返回值
			super.onPostExecute(result);
			if(result == null){
				Toast.makeText(listView.getContext(), "图片下载失败", Toast.LENGTH_SHORT).show();
				return;
			}
			ImageView imageView = (ImageView) listView.findViewWithTag(tag);
			if(imageView != null){
				imageView.setImageBitmap(result);
			} 
			
		}
		
	}
	//根据url获取网络图片的数据流
	private static Bitmap returnBitMap(String url){ //这个方法的问题，这个方法通过网络下载图片了，你又用在了adapter里，默认adapter里的方法也都是运行在主线程的，所以报错了
        URL myFileUrl = null;   
        Bitmap bitmap = null;  
        try {   
            myFileUrl = new URL(url);   
        } catch (MalformedURLException e) {   
            e.printStackTrace();   
        }   
        try {   
            HttpURLConnection conn = (HttpURLConnection) myFileUrl   
              .openConnection();   
            conn.setDoInput(true);   
            conn.connect();   
            InputStream is = conn.getInputStream();   
            bitmap = BitmapFactory.decodeStream(is);   
            is.close();   
        } catch (IOException e) {   
              e.printStackTrace();   
        }   
              return bitmap;   
    }   
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public void onClick(View arg0) {
		if (adapter.getCount() > 100) {// 写死了一个大于100条数据就不显示加载更多了
			if (listView.getFooterViewsCount() > 0) {
				listView.removeFooterView(footView);
			}
		} else {
			new Thread(new Runnable() {//刚才那个错的意思是在主线程发起了网络请求，android4.0之后对网络访问做了限制，默认情况下网络访问不能放在主线程里，不然会报错
				@Override
				public void run() {
					try {
						strjson = JSONProvider.getJSONData("http://192.168.1.103:888/?method=getUserList");
						/*android手机就相当于一个小linux系统
						写127.0.0.1，相当于请求到系统自己的地址了，但系统这个地址又不对外提供服务，就refused了*/
						Log.i("strjson", strjson);
					} catch (IOException e) {
						e.printStackTrace();
					}
					Message msg = new Message();
					msg.what = TIME_UP2;
					handler.sendMessage(msg);
				}
			}).start();
		}
	}

private List<Person> getDataByJson(String json){//根据json字符串组装list
	List<Person> persons = new ArrayList<Person>();  
	JSONArray jsonArray;
	try {
		jsonArray = new JSONArray(json);
		for(int i = 0; i < jsonArray.length(); i++) {  
		    JSONObject jsonObject = jsonArray.getJSONObject(i);  
		    long id = jsonObject.getLong("id");  
		    String name = jsonObject.getString("name");  
		    int age = jsonObject.getInt("age");  
		    String pic = jsonObject.getString("pic");
		    Person person = new Person(id,name, age, pic);  
		    persons.add(person);  
		}  
	} catch (JSONException e) {
		e.printStackTrace();
	}  
	return persons;
}
	
	static class Person {// 创建对象封装数据
		private long id;
		private int age;
		private String name;
		private String pic;
		public Person(long id,String name, int age, String pic) {  
	        super();   
	        this.id = id;  
	        this.name = name;  
	        this.age = age; 
	        this.pic = pic;  
	    } 
		public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public long getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}

		public String getPic() {
			return pic;
		}

		public void setPic(String pic) {
			this.pic = pic;
		}
	}

}
