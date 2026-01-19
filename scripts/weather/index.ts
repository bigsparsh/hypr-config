import axios from "axios";

const makeReq = async () => {
  const req = await axios.get(
    "https://api.weatherapi.com/v1/forecast.json?q=Dehradun&days=1&key=c6d41a7ea83942e894140750240109",
  );
  console.log("ICON: ", req.data.current.condition.text);
  console.log("TEMP: ", req.data.current.temp_c);
};
makeReq();
