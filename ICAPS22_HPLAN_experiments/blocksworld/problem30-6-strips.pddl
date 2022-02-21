( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b970 - block
    b702 - block
    b416 - block
    b877 - block
    b155 - block
    b424 - block
    b618 - block
    b331 - block
    b17 - block
    b108 - block
    b629 - block
    b512 - block
    b231 - block
    b402 - block
    b73 - block
    b559 - block
    b839 - block
    b478 - block
    b506 - block
    b627 - block
    b332 - block
    b732 - block
    b781 - block
    b923 - block
    b410 - block
    b442 - block
    b84 - block
    b181 - block
    b56 - block
    b835 - block
    b464 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b970 )
    ( on b702 b970 )
    ( on b416 b702 )
    ( on b877 b416 )
    ( on b155 b877 )
    ( on b424 b155 )
    ( on b618 b424 )
    ( on b331 b618 )
    ( on b17 b331 )
    ( on b108 b17 )
    ( on b629 b108 )
    ( on b512 b629 )
    ( on b231 b512 )
    ( on b402 b231 )
    ( on b73 b402 )
    ( on b559 b73 )
    ( on b839 b559 )
    ( on b478 b839 )
    ( on b506 b478 )
    ( on b627 b506 )
    ( on b332 b627 )
    ( on b732 b332 )
    ( on b781 b732 )
    ( on b923 b781 )
    ( on b410 b923 )
    ( on b442 b410 )
    ( on b84 b442 )
    ( on b181 b84 )
    ( on b56 b181 )
    ( on b835 b56 )
    ( on b464 b835 )
    ( clear b464 )
  )
  ( :goal
    ( and
      ( clear b970 )
    )
  )
)
