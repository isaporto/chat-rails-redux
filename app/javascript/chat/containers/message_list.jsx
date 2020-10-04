import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Message from '../components/message';
import MessageForm from './message_form';
import { fetchMessages } from '../actions';


class MessageList extends Component {
  componentWillMount() {
    this.fetchMessages();
  }

  componentDidMount() {
    // this.refresher = setInterval(this.fetchMessages, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.refresher);
  }

  componentDidUpdate() {
    this.list.scrollTop = this.list.scrollHeight;
  }

  fetchMessages = () => {
    const { selectedChannel } = this.props;
    this.props.fetchMessages(selectedChannel);
  }


  render() {
    const { messages, selectedChannel } = this.props;
    return (
      <div className="messages-container">
        <div className="title">
          <span>Channel #{selectedChannel}</span>
        </div>
        <div className="message-list" ref={(list) => { this.list = list; }}>
          {messages.map(message => <Message message={message} key={message.id} />)}
        </div>
        <MessageForm />
      </div>
    );
  }
}

const mapDispatchToProps = (dispatch) => {
  return bindActionCreators(
    { fetchMessages },
    dispatch
  );
};

const mapStateToProps = (state) => {
  return {
    selectedChannel: state.selectedChannel,
    messages: state.messages,
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(MessageList);
