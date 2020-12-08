const allCohorts = async () => {
  try {
   return fetch('http://localhost:8000/api/cohorts/');
  }
  catch(err) {
    return {'error': 'There was an error retrieving all cohorts.', 'status': 200}
  }
}


export default {
  allCohorts
}
