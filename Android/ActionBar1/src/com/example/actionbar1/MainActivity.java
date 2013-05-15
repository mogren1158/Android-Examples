package com.example.actionbar1;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

public class MainActivity extends Activity
{

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_main, menu);
      return true;
   }

   @Override
   public boolean onOptionsItemSelected(MenuItem item)
   {
      boolean result = false;

      switch (item.getItemId())
      {
         case R.id.settings:
            Toast.makeText(this, "Settings Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         case R.id.about:
            Toast.makeText(this, "About Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         default:
            result = super.onOptionsItemSelected(item);
            break;
      }
      
      return result;
   }

}
