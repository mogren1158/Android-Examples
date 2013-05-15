package com.example.dialogfragmentdelete;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;

public class DeleteFragment extends Fragment implements OnClickListener
{

   Button fragmentButton;
   
   @Override
   public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstance)
   {
      View view = inflater.inflate(R.layout.fragment_delete, container, false);
      
      fragmentButton = (Button) view.findViewById(R.id.buttonDelete);
      fragmentButton.setOnClickListener(this);
      return view;
   }
   
   @Override
   public void onClick(View arg0)
   {
      //create a dialog fragment
     FragmentManager manager = this.getFragmentManager();
     FragmentTransaction transaction = manager.beginTransaction();
     
     DeleteDialogFragment deleteFragment = new DeleteDialogFragment();
     
     deleteFragment.show(transaction, "dialog_fragment");
      
   }
   
}
