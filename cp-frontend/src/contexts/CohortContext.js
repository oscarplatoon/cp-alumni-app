import React, { createContext, useReducer } from 'react';
import { cohortReducer } from '../reducers/CohortReducer';
import CohortAPI from '../api/CohortAPI'

export const CohortContext = createContext()

const CohortProvider = (props) => {
  const [cohorts, dispatch] = useReducer(cohortReducer, {}, async () => {
    let response = await CohortAPI.allCohorts()
    let data = await response.json()
    dispatch({type: 'GET_COHORTS', data})
  })

  return (
    <CohortContext.Provider value={{cohorts, dispatch}}>
      {props.children}
    </CohortContext.Provider>
  );
};

export default CohortProvider;

