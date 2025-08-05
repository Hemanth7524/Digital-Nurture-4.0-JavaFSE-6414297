import CohortDetails from "./CohortDetails";

function App() {
  const cohorts = [
    { name: 'Java Full Stack', startDate: '2025-06-01', endDate: '2025-09-01', status: 'ongoing' },
    { name: 'React Training', startDate: '2025-03-01', endDate: '2025-06-01', status: 'completed' }
  ];

  return (
    <div className="App">
      {cohorts.map((c, index) => (
        <CohortDetails key={index} cohort={c} />
      ))}
    </div>
  );
}

export default App;
