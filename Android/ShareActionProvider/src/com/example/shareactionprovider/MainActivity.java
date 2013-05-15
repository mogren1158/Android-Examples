package com.example.shareactionprovider;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ShareActionProvider;
import android.widget.Toast;

import com.example.actionprovider2.R;

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

      MenuItem shareItem = menu.findItem(R.id.share);
      ShareActionProvider sap = (ShareActionProvider) shareItem.getActionProvider();
      sap.setShareHistoryFileName(ShareActionProvider.DEFAULT_SHARE_HISTORY_FILE_NAME);
      sap.setShareIntent(getShareIntent());
      return true;
   }

   private Intent getShareIntent()
   {
      Intent shareIntent = new Intent(Intent.ACTION_SEND);
      shareIntent.setType("text/plain");
      shareIntent.putExtra(Intent.EXTRA_TEXT, "www.somesite.com");
      return shareIntent;
   }

   @Override
   public boolean onOptionsItemSelected(MenuItem item)
   {
      boolean result = false;

      Log.v("MainActivity", "onOptionsItemSelected");
      switch (item.getItemId())
      {
      /*
       * case R.id.settings: Toast.makeText(this, "Settings Clicked",
       * Toast.LENGTH_SHORT).show(); result = true; break;
       */
         case R.id.about:
            Toast.makeText(this, "About Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         case R.id.thing1:
            Toast.makeText(this, "thing1 Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         case R.id.thing2:
            Toast.makeText(this, "thing2 Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         case R.id.thing3:
            Toast.makeText(this, "thing3 Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         default:
            result = super.onOptionsItemSelected(item);
            break;
      }

      return result;
   }

}
