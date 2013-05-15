package com.example.fragmentbookexample;

import android.app.ListFragment;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;

public class FragmentA extends ListFragment implements OnItemClickListener
{
   @Override
   public void onActivityCreated(Bundle savedInstanceState)
   {
      super.onActivityCreated(savedInstanceState);
      
      ArrayAdapter<String> adapter = new ArrayAdapter<String>(this.getActivity(), android.R.layout.simple_list_item_1, Book.GetBookNames());
      this.setListAdapter(adapter);
      getListView().setOnItemClickListener(this);
   }
   
   @Override
   public void onItemClick(AdapterView<?> parent, View view, int position, long id)
   {
      String author = Book.GetAuthorNames()[position];
      Intent intent = new Intent(this.getActivity().getApplicationContext(), ActivityB.class);
      intent.putExtra("author", author);
      startActivity(intent);
   }

}
