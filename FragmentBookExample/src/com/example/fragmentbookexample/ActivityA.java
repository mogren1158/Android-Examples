package com.example.fragmentbookexample;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class ActivityA extends Activity
{

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_activity);
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_activity, menu);
      return true;
   }

}
