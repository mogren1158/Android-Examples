package com.example.dialogfragmentdelete;

import android.os.Bundle;
import android.preference.PreferenceFragment;

public class CustomPreferenceFragment extends PreferenceFragment
{
   @Override
   public void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      
      this.addPreferencesFromResource(R.xml.preference_layout);
   }

}
