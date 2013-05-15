package com.example.dialogfragmentdelete;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class CustomPreferenceActivity extends Activity
{

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_custom_preference);
      
      getFragmentManager().beginTransaction().replace(android.R.id.content, new CustomPreferenceFragment()).commit();
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_custom_preference, menu);
      return true;
   }

}
