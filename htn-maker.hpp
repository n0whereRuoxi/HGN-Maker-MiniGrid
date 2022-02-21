#define FLAG_DROP_UNNEEDED              0x00000004
#define FLAG_FORCE_OPS_FIRST            0x00000008
#define FLAG_HARD_SQUELCH               0x00000010
#define FLAG_NO_SUBSUMPTION             0x00000020
#define FLAG_PARTIAL_GENERALIZATION     0x00000040
#define FLAG_ONLY_TASK_EFFECTS          0x00000080
#define FLAG_SOUNDNESS_CHECK            0x00000100
#define FLAG_ND_CHECKERS                0x00000200
#define FLAG_QVALUES                    0x00000400
#define FLAG_REQUIRE_NEW                0x00000001
#define FLAG_VARIABLE_LINKAGE           0x00000002

void LearnMethods( AnnotatedPlan * p_pPlan,
                   HtnTaskList * p_pTasks,
                   HtnDomain * p_pHtnDomain );

void LearnMethodsFromExactSequence(unsigned int p_iInitState, unsigned int p_iFinalState, AnnotatedPlan * p_pPlan,
                   HtnTaskList * p_pTasks,
                   HtnDomain * p_pHtnDomain );

void DoSubsumption( HtnDomain * p_pHtnDomain,
                    HtnMethod * p_pNewMethod );

void DoQValueUpdate( HtnDomain * p_pHtnDomain,
                     HtnMethod * p_pNewMethod );

void LearnFromExactSequence( unsigned int p_iInitState,
                             unsigned int p_iFinalState,
                             AnnotatedPlan * p_pPlan,
                             HtnDomain * p_pDomain,
                             const PartialHtnMethod * p_pPartial );

void LearnFromSubsequences( unsigned int p_iInitState,
                            unsigned int p_iFinalState,
                            AnnotatedPlan * p_pPlan,
                            HtnDomain * p_pDomain,
                            const std::vector< PartialHtnMethod * > & p_vPartials );

bool TrySolving( AnnotatedPlan * p_pPlan, 
                 unsigned int p_iInitState,
                 unsigned int p_iForState,
                 const std::tr1::shared_ptr< HtnTaskDescr > & p_pTask,
                 const Substitution * p_pTaskSubs,
                 const Substitution * p_pMasterSubs,
                 const HtnDomain * p_pDomain );

void MakeSoundnessCheckMethods( const HtnTaskList * p_pTasks,
                                HtnDomain * p_pDomain );

void MakeTrivialNdCheckers( HtnDomain * p_pDomain );
void LearnNdCheckers( unsigned int p_iAction,
                      const StripsSolution * p_pPlan,
                      HtnDomain * p_pDomain );
void LearnOneNdChecker( unsigned int p_iInitState,
                        unsigned int p_iFinalState,
                        const Operator * p_pDesiredOp,
                        const StripsSolution * p_pPlan,
                        HtnDomain * p_pDomain );

int DoExperiment(int l_iProblemNumber, int l_iTimesNumber);

unsigned long g_iFlags;
unsigned int g_iMaxMethodId;
char g_cMethodIdStr[8];
