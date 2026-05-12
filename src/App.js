import './App.css';
import BestRest from './Components/BestRest';
import Footer from './Components/Footer';
import Navigate from './Components/Navigate';
import OffersBanner from './Components/OffersBanner';
import RestaurentChain from './Components/RestaurentChain';
import RestaurentOnline from './Components/RestaurentOnline';

function App() {
  return (
<div
  style={{
    backgroundColor: "#d4ffd4",
    minHeight: "100vh",
    padding: "20px"
  }}
>
  <h1
    style={{
      color: "green",
      textAlign: "center",
      fontSize: "40px"
    }}
  >
    GREEN VERSION DEPLOYMENT
  </h1>

  <Navigate/>
  <OffersBanner/>
  <RestaurentChain/>
  <RestaurentOnline/>
  <BestRest/>
  <Footer/>
</div>

  );
}

export default App;
