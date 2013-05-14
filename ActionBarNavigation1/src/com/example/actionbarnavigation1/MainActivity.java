package com.example.actionbarnavigation1;

import android.app.ActionBar;
import android.app.ActionBar.Tab;
import android.app.ActionBar.TabListener;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;

public class MainActivity extends Activity
{

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
      
      ActionBar actionBar = this.getActionBar();
      actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
      
      Tab tab = actionBar.newTab().setText("Fragment A").setTabListener(new CustomTabListener<FragmentA>(this, "fragmentA", FragmentA.class));
      actionBar.addTab(tab);
      
      tab = actionBar.newTab().setText("Fragment B").setTabListener(new CustomTabListener<FragmentB>(this, "fragmentB", FragmentB.class));
      actionBar.addTab(tab);
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_main, menu);
      return true;
   }
   
   
   public static class CustomTabListener <T extends Fragment> implements TabListener
   {
      private static final String tag = "CustomTabListener";
      private Fragment mFragment;
      private final Activity mActivity;
      private final String mTag;
      private final Class<T> mClass;
      
      public CustomTabListener(Activity activity, String tag, Class <T> clazz)
      {
         mActivity = activity;
         mTag = tag;
         mClass = clazz;
      }
      
      @Override
      public void onTabSelected(Tab tab, FragmentTransaction ft)
      {
         Log.v(tag, "onTabSelected");
         //initialize the fragment and add it to the activity if it doesn't exist. 
         if(mFragment == null)
         {
            mFragment = Fragment.instantiate(mActivity, mClass.getName());
            ft.add(android.R.id.content, mFragment, mTag);
         }
         else
         {
            ft.attach(mFragment);
         }
         
      }

      @Override
      public void onTabUnselected(Tab tab, FragmentTransaction ft)
      {
         Log.v(tag, "onTabUnSelected");
         //called when the fragment is unselected, just remove the fragment
         if(mFragment != null)
         {
            ft.detach(mFragment);
         }
         
      }

      @Override
      public void onTabReselected(Tab tab, FragmentTransaction ft)
      {
         Log.v(tag, "onTabReSelected");
         //tab is reselected
         
      }

   }

}
