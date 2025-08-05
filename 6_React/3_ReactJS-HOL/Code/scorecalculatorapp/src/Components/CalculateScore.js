import '../Stylesheets/mystyle.css';

const percentToDecimal = (decimal) => {
  return decimal.toFixed(2) + '%';
};

const calcScore = (total, goal) => {
  return percentToDecimal(total / goal);
};

export const CalculateScore = ({ Name, School, total, goal }) => (
  <div className="formatstyle">
    <h1 style={{ color: 'brown' }}>Student Details:</h1>

    <div className="Name">
      <b><span>Name: </span></b>
      <span>{Name}</span>
    </div>

    <div className="School">
      <b><span>School: </span></b>
      <span>{School}</span>
    </div>

    <div className="Total">
      <b><span>Total: </span></b>
      <span>{total} Marks</span>
    </div>

    <div className="Score">
      <b>Score: </b>
      <span>{calcScore(total, goal)}</span>
    </div>
  </div>
);


/*function CalculateScore(props) {
  const { name, school, total, goal } = props;
  const average = total / goal;

  return (
    <div className="score-card">
      <h2>Student Score Details</h2>
      <p><strong>Name:</strong> {name}</p>
      <p><strong>School:</strong> {school}</p>
      <p><strong>Total Marks:</strong> {total}</p>
      <p><strong>Subjects:</strong> {goal}</p>
      <p><strong>Average Score:</strong> {average.toFixed(2)}</p>
    </div>
  );
}*/

export default CalculateScore;
