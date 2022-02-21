( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b671 - block
    b679 - block
    b488 - block
    b157 - block
    b868 - block
    b19 - block
    b473 - block
    b612 - block
    b102 - block
    b442 - block
    b543 - block
    b539 - block
    b982 - block
    b27 - block
    b513 - block
    b871 - block
    b876 - block
    b791 - block
    b804 - block
    b173 - block
    b604 - block
    b268 - block
    b690 - block
    b434 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b671 )
    ( on b679 b671 )
    ( on b488 b679 )
    ( on b157 b488 )
    ( on b868 b157 )
    ( on b19 b868 )
    ( on b473 b19 )
    ( on b612 b473 )
    ( on b102 b612 )
    ( on b442 b102 )
    ( on b543 b442 )
    ( on b539 b543 )
    ( on b982 b539 )
    ( on b27 b982 )
    ( on b513 b27 )
    ( on b871 b513 )
    ( on b876 b871 )
    ( on b791 b876 )
    ( on b804 b791 )
    ( on b173 b804 )
    ( on b604 b173 )
    ( on b268 b604 )
    ( on b690 b268 )
    ( on b434 b690 )
    ( on b233 b434 )
    ( clear b233 )
  )
  ( :goal
    ( and
      ( clear b671 )
    )
  )
)
