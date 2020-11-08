import React from 'react';

import MessageList from '../containers/message_list';
import ChannelList from '../containers/channel_list';
import Logo from 'images/logo.svg'

const App = (props) => {
  const { channel } = props.match.params;
  return (
    <div className="app">
      <div className="logo-container">
        <img className="messaging-logo" src={Logo} alt="logo" />
      </div>
      <ChannelList selectedChannel={ channel } />
      <MessageList selectedChannel={ channel } />
    </div>
  );
};

export default App;
