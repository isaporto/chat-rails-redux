import React, { Component } from 'react';
import {emojify} from 'react-emojione';

class Message extends Component {
  hashCode = (str) => {
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
       hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }
    return hash;
  } 

  intToRGB = (i) => {
    var c = (i & 0x00FFFFFF)
        .toString(16)
        .toUpperCase();

    return "00000".substring(0, 6 - c.length) + c;
  }

  render () {
    const { id, author, content, created_at } = this.props.message;
    const style = {
      color: `#${this.intToRGB(this.hashCode(author))}`
    };
    return (
      <div className="message" id={id}>
        <p><i className="author" style={style}>{author}</i> <em>{created_at}</em></p>
        <p>{emojify(content)}</p>
      </div>
    );
  }
};

export default Message;
