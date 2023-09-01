import { useEffect, useState } from "react";

import "@/App.css";
import reactLogo from "@/assets/react.svg";
import { trpc } from "@/utils/trpc";
import viteLogo from "/vite.svg";

const App = () => {
  const [count, setCount] = useState(0);
  const { data, isLoading } = trpc.getShippers.useQuery();
  const createShipper = trpc.createShipper.useMutation();

  useEffect(() => {
    if (isLoading) {
      console.log("loading shippers");
      return;
    }

    data?.forEach((shipper) => {
      const { company_name, id, address } = shipper;
      //                                    ^?

      console.log(id, company_name);
    });

    // FIXME: not creating new shipper
    createShipper.mutate({
      company_name: "Scott",
      phone: "5555555555",
    });
  }, [data, isLoading]);

  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank" rel="noreferrer">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank" rel="noreferrer">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button
          onClick={() => {
            setCount((count) => count + 1);
          }}
        >
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">Click on the Vite and React logos to learn more</p>
    </>
  );
};

export default App;
