package com.example.shareactionprovider;

import java.lang.reflect.Field;

import android.app.Application;
import android.view.ViewConfiguration;

public class ForceSoftMenuApplication extends Application
{

   @Override
   public void onCreate()
   {
      super.onCreate();
      this.getOverflowMenu();
   }

   /**
    * //http://stackoverflow.com/questions/9739498/android-action-bar-not-
    * showing-overflow force use of the overflow menu, and disables the hardware
    * menu button
    */
   private void getOverflowMenu()
   {

      try
      {
         ViewConfiguration config = ViewConfiguration.get(this);
         Field menuKeyField = ViewConfiguration.class.getDeclaredField("sHasPermanentMenuKey");
         if (menuKeyField != null)
         {
            menuKeyField.setAccessible(true);
            try
            {
               menuKeyField.setBoolean(config, false);
            }
            catch (IllegalArgumentException e)
            {
               e.printStackTrace();
            }
            catch (IllegalAccessException e)
            {
               e.printStackTrace();
            }
         }
      }
      catch (NoSuchFieldException e)
      {
         e.printStackTrace();
      }
   }
}
