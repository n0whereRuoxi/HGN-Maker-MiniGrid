( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b13 - block
    b876 - block
    b324 - block
    b649 - block
    b570 - block
    b215 - block
    b624 - block
    b684 - block
    b673 - block
    b55 - block
    b66 - block
    b833 - block
    b899 - block
    b114 - block
    b839 - block
    b772 - block
    b770 - block
    b950 - block
    b14 - block
    b660 - block
    b53 - block
    b97 - block
    b278 - block
    b682 - block
    b96 - block
    b548 - block
    b941 - block
    b430 - block
    b9 - block
    b420 - block
    b536 - block
    b389 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b13 )
    ( on b876 b13 )
    ( on b324 b876 )
    ( on b649 b324 )
    ( on b570 b649 )
    ( on b215 b570 )
    ( on b624 b215 )
    ( on b684 b624 )
    ( on b673 b684 )
    ( on b55 b673 )
    ( on b66 b55 )
    ( on b833 b66 )
    ( on b899 b833 )
    ( on b114 b899 )
    ( on b839 b114 )
    ( on b772 b839 )
    ( on b770 b772 )
    ( on b950 b770 )
    ( on b14 b950 )
    ( on b660 b14 )
    ( on b53 b660 )
    ( on b97 b53 )
    ( on b278 b97 )
    ( on b682 b278 )
    ( on b96 b682 )
    ( on b548 b96 )
    ( on b941 b548 )
    ( on b430 b941 )
    ( on b9 b430 )
    ( on b420 b9 )
    ( on b536 b420 )
    ( on b389 b536 )
    ( clear b389 )
  )
  ( :goal
    ( and
      ( clear b13 )
    )
  )
)
