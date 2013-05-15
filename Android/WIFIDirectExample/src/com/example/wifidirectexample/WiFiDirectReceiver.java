package com.example.wifidirectexample;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.NetworkInfo;
import android.net.wifi.p2p.WifiP2pManager;
import android.net.wifi.p2p.WifiP2pManager.Channel;
import android.net.wifi.p2p.WifiP2pManager.PeerListListener;
import android.widget.Toast;

public class WiFiDirectReceiver extends BroadcastReceiver
{

   private WifiP2pManager manager;
   private Channel        channel;
   private Activity       activity;

   public WiFiDirectReceiver(WifiP2pManager manager, Channel channel, Activity activity)
   {
      super();

      this.manager = manager;
      this.channel = channel;
      this.activity = activity;
   }

   @Override
   public void onReceive(Context context, Intent intent)
   {
      String action = intent.getAction();

      if (WifiP2pManager.WIFI_P2P_STATE_CHANGED_ACTION.equals(action))
      {
         int state = intent.getIntExtra(WifiP2pManager.EXTRA_WIFI_STATE, -1);
         if (state == WifiP2pManager.WIFI_P2P_STATE_ENABLED)
         {
            // wifi direct mode is enabled, yay
            Toast.makeText(activity, "wifi direct is enabled", Toast.LENGTH_SHORT).show();
         }
         else
         {
            Toast.makeText(activity, "wifi direct is disabled", Toast.LENGTH_SHORT).show();
         }
      }
      else if (WifiP2pManager.WIFI_P2P_PEERS_CHANGED_ACTION.equals(action))
      {
         // request peers from the wifi p2p manager
         if (manager != null)
         {
            manager.requestPeers(channel, (PeerListListener) activity);
         }
      }
      else if (WifiP2pManager.WIFI_P2P_CONNECTION_CHANGED_ACTION.equals(action))
      {
         if (manager == null)
         {
            return;
         }

         NetworkInfo info = (NetworkInfo) intent
               .getParcelableExtra(WifiP2pManager.EXTRA_NETWORK_INFO);
         if (info.isConnected())
         {
            manager
                  .requestConnectionInfo(channel, (WifiP2pManager.ConnectionInfoListener) activity);
         }
         else
         {
            // it's a diconect
         }
      }
      else if (WifiP2pManager.WIFI_P2P_THIS_DEVICE_CHANGED_ACTION.equals(action))
      {
      }
   }

}
