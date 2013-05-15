package com.example.dialogfragmentdelete;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

public class DeleteFragment extends Fragment implements OnClickListener
{

   Button fragmentButton;
   
   @Override
   public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstance)
   {
      View view = inflater.inflate(R.layout.fragment_delete, container, false);
      
      fragmentButton = (Button) view.findViewById(R.id.buttonDelete);
      fragmentButton.setOnClickListener(this);
      this.setHasOptionsMenu(true);
      return view;
   }
   
   @Override
   public void onClick(View arg0)
   {
      SharedPreferences pref = PreferenceManager.getDefaultSharedPreferences(getActivity());
      
      if(pref.getBoolean("checkbox_preference", false))
      {
         //create a dialog fragment
        FragmentManager manager = this.getFragmentManager();
        FragmentTransaction transaction = manager.beginTransaction();
        
        DeleteDialogFragment deleteFragment = new DeleteDialogFragment();
        
        deleteFragment.show(transaction, "dialog_fragment");
      }
      else
      {
         Toast.makeText(getActivity(), "here", Toast.LENGTH_SHORT).show();
      }
      
   }
   
   @Override
   public void onCreateOptionsMenu(Menu menu, MenuInflater inflater)
   {
      inflater.inflate(R.menu.fragment_menu, menu);
   }
   
   
   @Override
   public boolean onOptionsItemSelected(MenuItem item)
   {
      Intent intent = new Intent(getActivity(), CustomPreferenceActivity.class);
      startActivity(intent);
      return true;
   }
}
