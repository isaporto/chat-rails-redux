/* eslint no-bitwise:off */

import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { selectChannel, fetchMessages } from '../actions/index';
import { Link } from "react-router-dom";

class ChannelList extends Component {
  componentWillReceiveProps(nextProps) {
    if (nextProps.selectedChannel !== this.props.selectedChannel) {
      this.props.fetchMessages(nextProps.selectedChannel);
    }
  }

  renderChannel = (ch) => {
    const { selectedChannel } = this.props;
    return (
      <li
        key={ch}
        className={selectedChannel === ch ? 'active' : null}
        role="presentation"
      >
        <Link to={`/channels/${ch}`}>
          #{ch}
        </Link>
      </li>
    );
  }

  render = () => {
    const { channels } = this.props;
    return (
      <div className="channels-container">
        <span>Redux Chat</span>
        <ul>
          { channels.map(this.renderChannel) }
        </ul>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    channels: state.channels
  };
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ selectChannel, fetchMessages }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(ChannelList);
