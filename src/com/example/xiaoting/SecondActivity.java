package com.example.xiaoting;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;
//新添加一个activity，要在manifest文件里注册，否则系统会报错
public class SecondActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		TextView textView = new TextView(this);
		
		Intent intent = getIntent();
		String name = intent.getStringExtra("name");
		long id = intent.getLongExtra("id",0);//第二个参数表示默认值，就是说如果娶不到，返回第二个参数里的值，在这里，就是说如果娶不到残谁能够是id的long型值，就返回0
		textView.setText(name+"     id="+id);
		setContentView(textView);
	}
}
