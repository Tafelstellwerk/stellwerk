var Donation = React.createClass({
  getInitialState: function(){
    console.log(this.props)
    return {
      name: this.props.item.title,
      amount: this.props.item.properties.amount,
      bestBefore: this.props.item.properties.bestBefore,
      availibleFrom: this.props.item.properties.availibleFrom,
      frozen: this.props.item.properties.frozen,
      name: this.props.item.properties.name,
      receipt: this.props.item.properties.receipt,
      deliveryTimes: this.props.item.properties.deliveryTimes,
    }
  },

  handleChange: function(property, event) {
    state = this.state;
    state[property] = event.target.value;

    this.setState(state);
  },

  render: function(){
    return <div className="donation-item">
        <div className="grid">
          <div className="grid__half">
            <label>Name</label>
            <input type="text" value={this.state.name} onChange={this.handleChange.bind(this, 'name')}/>
            <label>Menge</label>
            <input type="text" value={this.state.amount} onChange={this.handleChange.bind(this, 'amount')}/>
            <label>Mindesthaltbarkeitsdatum</label>
            <input type="text" value={this.state.bestBefore} onChange={this.handleChange.bind(this, 'bestBefore')}/>
            <label>Verfügbar ab</label>
            <input type="text" value={this.state.availibleFrom} onChange={this.handleChange.bind(this, 'availibleFrom')}/>
          </div>
          <div className="grid__half">
            <label>Tiefkühlware</label>
            <input type="radio" name="tief" defaultValue="yes" /><span className="radio__label">Ja</span>
            <input type="radio" name="tief" defaultValue="no" /><span className="radio__label">Nein</span>
            <label>Spendenbeleg</label>
            <input type="radio" name="Spendenbeleg" defaultValue="yes" /><span className="radio__label">Ja</span>
            <input type="radio" name="Spendenbeleg" defaultValue="no" /><span className="radio__label">Nein</span>
            <label>Abholzeiten</label>
            <input type="text" value={this.state.deliveryTimes} onChange={this.handleChange.bind(this, 'deliveryTimes')}/>
          </div>
        </div>
      </div>

  }
});

var AddDonationButton = React.createClass({
  render: function() {
    return <div onClick={this.addDonation} class="button button__primary">
      Neuer Spendenposten
    </div>
  }
});

var Donations = React.createClass({
  getInitialState: function(){
    return {
      items: this.props.items,
      newItems: []
    }
  },

  addDonations: function() {
    this.setState(this.state.newItems.concat([{title: "", properties: {}}]))
  },

  render: function() {
    return <div>
      {this.state.items.concat(this.newItems).map(function(item, i) {
          return (
            <Donation key={i} item={item}></Donation>
          )
        }, this)}
        <AddDonationButton onClick={this.addDonation}></AddDonationButton>
    </div>
  }
});
