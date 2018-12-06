MODULE DEVICE_VARIABLES

USE PRECISION_PARAMETERS
IMPLICIT NONE

INTEGER, ALLOCATABLE, DIMENSION(:) :: DEVC_PIPE_OPERATING

TYPE PROPERTY_TYPE
   REAL(EB) :: DENSITY,DIAMETER,EMISSIVITY,HEAT_TRANSFER_COEFFICIENT,SPECIFIC_HEAT,RTI, &
               ACTIVATION_TEMPERATURE,ACTIVATION_OBSCURATION, &
               ALPHA_E,ALPHA_C,BETA_E,BETA_C,CHARACTERISTIC_VELOCITY,PARTICLE_VELOCITY,MASS_FLOW_RATE,FLOW_RATE,FLOW_TAU, &
               GAUGE_EMISSIVITY,GAUGE_TEMPERATURE,INITIAL_TEMPERATURE,K_FACTOR,C_FACTOR,OPERATING_PRESSURE,OFFSET,&
               SPRAY_ANGLE(2,2),P0=0._EB,PX(3)=0._EB,PXX(3,3)=0._EB
   INTEGER  :: PDPA_M=0,PDPA_N=0,N_SMOKEVIEW_PARAMETERS=0,N_SMOKEVIEW_IDS=0,N_INSERT,I_VEL=0,PARTICLES_PER_SECOND
   LOGICAL  :: PDPA_INTEGRATE=.TRUE.,PDPA_NORMALIZE=.TRUE.,PDPA_HISTOGRAM=.FALSE.,PDPA_HISTOGRAM_CUMULATIVE=.FALSE.
   REAL(EB) :: PDPA_START=0._EB,PDPA_END=1.E6_EB,PDPA_RADIUS=0.1_EB
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: TABLE_ROW, V_FACTOR
   INTEGER  :: PART_INDEX=-1,FLOW_RAMP_INDEX,SPRAY_PATTERN_INDEX,Z_INDEX=-999,Y_INDEX=-999,PRESSURE_RAMP_INDEX
   CHARACTER(LABEL_LENGTH) :: SMOKEVIEW_ID(SMOKEVIEW_OBJECTS_DIMENSION),PART_ID,ID,QUANTITY,TABLE_ID,SPEC_ID='null', &
                    SMOKEVIEW_PARAMETERS(SMOKEVIEW_OBJECTS_DIMENSION)='null'
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: SPRAY_LON_CDF,SPRAY_LON,SPRAY_LAT
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: SPRAY_LAT_CDF
   REAL(EB) :: PDPA_HISTOGRAM_LIMITS(2) = 0._EB
   INTEGER :: PDPA_HISTOGRAM_NBINS=10,FED_ACTIVITY=2
END TYPE PROPERTY_TYPE

TYPE SUBDEVICE_TYPE
   REAL(EB) :: VALUE_1=0._EB,VALUE_2=0._EB,VALUE_3=0._EB,X1,X2,Y1,Y2,Z1,Z2
   INTEGER :: MESH,I1=-1,I2=-1,J1=-1,J2=-1,K1=-1,K2=-1,N_PATH=0
   INTEGER, ALLOCATABLE, DIMENSION(:) :: I_PATH,J_PATH,K_PATH
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: D_PATH
END TYPE SUBDEVICE_TYPE

TYPE DEVICE_TYPE
   TYPE(SUBDEVICE_TYPE), ALLOCATABLE, DIMENSION(:) :: SUBDEVICE
   REAL(EB) :: T,X,Y,Z,X1,X2,Y1,Y2,Z1,Z2,INITIAL_VALUE=-1.E10_EB,INSTANT_VALUE,VALUE=0._EB,SMOOTHED_VALUE=-1.E10_EB, &
               DEPTH,TMP_L,Y_C,OBSCURATION,DELAY,ROTATION,SMOOTHING_FACTOR=0._EB,VALUE_1,VALUE_2,VALUE_3,&
               SETPOINT, T_CHANGE=1.E6_EB,BYPASS_FLOWRATE,DT,TOTAL_FLOWRATE,FLOWRATE, &
               CONVERSION_ADDEND=0._EB,CONVERSION_FACTOR=1._EB,COORD_FACTOR=1._EB, &
               TIME_INTERVAL=0._EB,QUANTITY_RANGE(2),STATISTICS_START=-1.E20_EB,STATISTICS_END=1.E20_EB,&
               OVEC(3),CELL_L=-1._EB,RMS_VALUE=0._EB,RMS_VALUE2=0._EB,COV_VALUE=0._EB,AVERAGE_VALUE=0._EB,AVERAGE_VALUE2=0._EB,&
               PDPA_NUMER=0._EB,PDPA_DENUM=0._EB,Z_INT,TMP_UP,TMP_LOW,TIME_PERIOD=-1._EB
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: TIME_ARRAY,TIME_MAX_VALUE,TIME_MIN_VALUE
   REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: YY_SOOT
   REAL(EB), POINTER, DIMENSION(:) :: T_E,Y_E
   INTEGER  :: N_SUBDEVICES=0,OUTPUT_INDEX,OUTPUT2_INDEX,IOR,IOR_ASSUMED=0,WALL_INDEX=-1,ORDINAL,I,J,K,MESH,&
               I_DEPTH,N_T_E,PROP_INDEX,ORIENTATION_INDEX=0,TRIP_DIRECTION,CTRL_INDEX=-1,N_INPUTS,SURF_INDEX=-1,&
               Z_INDEX=-999,Y_INDEX=-999,MATL_INDEX=-999,PART_CLASS_INDEX=0,REAC_INDEX=0,VELO_INDEX=0,&
               NO_UPDATE_DEVC_INDEX=-1,NO_UPDATE_CTRL_INDEX=-1,CFACE_INDEX=-1,FED_ACTIVITY=2,GHOST_CELL_IOR(3)=0,&
               DUCT_INDEX=-1,NODE_INDEX(2)=-1,POINT=1,LINE=0,LINE_COORD_CODE=123,PIPE_INDEX=1,LP_TAG=0,ORIENTATION_NUMBER=0,&
               DUCT_CELL_INDEX=-1,LOWEST_MESH=0,N_INTERVALS=-1
   INTEGER, ALLOCATABLE, DIMENSION(:) :: DEVC_INDEX,SUBDEVICE_INDEX
   CHARACTER(LABEL_LENGTH) :: ID,PROP_ID,QUANTITY,QUANTITY2,CTRL_ID,DEVC_ID,SPATIAL_STATISTIC='null',TEMPORAL_STATISTIC='null',&
                    SURF_ID,PART_ID='null',SPEC_ID='null',MATL_ID='null',&
                    SMOKEVIEW_BAR_LABEL,UNITS='null',XYZ_UNITS='m',DUCT_ID='null',NODE_ID(2)='null',MOVE_ID='null',&
                    R_ID='null',X_ID='null',Y_ID='null',Z_ID='null',&
                    INIT_ID='null',NO_UPDATE_DEVC_ID='null',NO_UPDATE_CTRL_ID='null',REAC_ID='null'
   CHARACTER(60) :: SMOKEVIEW_LABEL
   LOGICAL :: INITIAL_STATE,CURRENT_STATE,LATCH,PRIOR_STATE,DRY=.FALSE.,&
              EVACUATION=.FALSE.,RELATIVE=.FALSE.,OUTPUT=.TRUE.,ABSOLUTE_VALUE=.FALSE.
   REAL(EB), ALLOCATABLE, DIMENSION(:) :: PDPA_HISTOGRAM_COUNTS
END TYPE DEVICE_TYPE

! Device arrays

INTEGER :: N_PROP,N_DEVC,N_DEVC_TIME,N_DEVC_LINE,MAX_DEVC_LINE_POINTS=1,N_PDPA_HISTOGRAM = 0,MAX_PDPA_HISTOGRAM_NBINS = 0
CHARACTER(80), ALLOCATABLE, DIMENSION(:) :: TIME_DEVC_LABEL,TIME_DEVC_UNITS,LINE_DEVC_LABEL,LINE_DEVC_UNITS, &
                                            PDPA_HISTOGRAM_LABEL, PDPA_HISTOGRAM_UNITS
CHARACTER(80), ALLOCATABLE, DIMENSION(:,:) :: LINE_DEVC_VALUE, PDPA_HISTOGRAM_VALUE
REAL(EB), ALLOCATABLE, DIMENSION(:) :: TIME_DEVC_VALUE
TYPE (PROPERTY_TYPE),  DIMENSION(:), ALLOCATABLE, TARGET :: PROPERTY
TYPE (DEVICE_TYPE),  DIMENSION(:), ALLOCATABLE, TARGET :: DEVICE

END MODULE DEVICE_VARIABLES



MODULE CONTROL_VARIABLES

! Variables for evaluating control functions

USE PRECISION_PARAMETERS

IMPLICIT NONE

TYPE CONTROL_TYPE
   LOGICAL :: SPECIFIED_STATE=.FALSE.,INITIAL_STATE=.FALSE.,CURRENT_STATE=.FALSE.,PRIOR_STATE=.FALSE.,LATCH=.TRUE.,UPDATED=.FALSE.
   LOGICAL :: EVACUATION=.FALSE.
   INTEGER :: CONTROL_INDEX=0,CYCLES=1,N_INPUTS=0,RAMP_INDEX=0,MESH=1,N=1,ON_BOUND=0,TRIP_DIRECTION
   INTEGER, ALLOCATABLE, DIMENSION (:) :: INPUT,INPUT_TYPE
   REAL(EB) :: SETPOINT(2)=1.E30_EB, DELAY=0._EB, T_CHANGE=1000000._EB ,CYCLE_TIME=1000000._EB,CONSTANT=-9.E30_EB,&
               INSTANT_VALUE,PROPORTIONAL_GAIN,INTEGRAL_GAIN,DIFFERENTIAL_GAIN,PREVIOUS_VALUE=-9.E30_EB,INTEGRAL=0._EB,&
               TARGET_VALUE = -9.E30_EB
   CHARACTER(LABEL_LENGTH) :: ID='null',RAMP_ID='null',INPUT_ID(40)='null'
END TYPE CONTROL_TYPE

TYPE (CONTROL_TYPE),  DIMENSION(:), ALLOCATABLE, TARGET :: CONTROL

INTEGER, PARAMETER :: AND_GATE=1, OR_GATE=2, XOR_GATE=3, X_OF_N_GATE=4, TIME_DELAY=5, DEADBAND=6, CYCLING=7, &
                      CUSTOM=8,KILL=9,CORE_DUMP=10,CF_SUM=11,CF_SUBTRACT=12,CF_MULTIPLY=13,CF_DIVIDE=14,CF_POWER=15,CF_PID=16,&
                      CF_EXP=17,CF_LOG=18,CF_SIN=19,CF_COS=20,CF_ASIN=21,CF_ACOS=22,CF_MIN=23,CF_MAX=24, CF_ABS=25,&
                      DEVICE_INPUT=1,CONTROL_INPUT=2,CONSTANT_INPUT=3

INTEGER :: N_CTRL = 0, N_CTRL_FILES = 0

END MODULE CONTROL_VARIABLES
