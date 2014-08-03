package com.example.xiaoting;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;
//�����һ��activity��Ҫ��manifest�ļ���ע�ᣬ����ϵͳ�ᱨ��
public class SecondActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		TextView textView = new TextView(this);
		
		Intent intent = getIntent();
		String name = intent.getStringExtra("name");
		long id = intent.getLongExtra("id",0);//�ڶ���������ʾĬ��ֵ������˵���Ȣ���������صڶ����������ֵ�����������˵���Ȣ������˭�ܹ���id��long��ֵ���ͷ���0
		textView.setText(name+"     id="+id);
		setContentView(textView);
	}
}
