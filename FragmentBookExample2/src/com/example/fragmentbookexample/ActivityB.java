package com.example.fragmentbookexample;


import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.widget.TextView;

public class ActivityB extends Activity
{

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_activity_b);

      String author = this.getIntent().getStringExtra("author");

      if (author != null)
      {
         TextView view = (TextView)this.findViewById(R.id.textViewAuthor);
         view.setText(author);
      }
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_activity_b, menu);
      return true;
   }

}
