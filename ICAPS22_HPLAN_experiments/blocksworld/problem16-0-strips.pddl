( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b342 - block
    b831 - block
    b219 - block
    b929 - block
    b797 - block
    b829 - block
    b740 - block
    b536 - block
    b997 - block
    b833 - block
    b979 - block
    b68 - block
    b116 - block
    b850 - block
    b153 - block
    b454 - block
    b592 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b342 )
    ( on b831 b342 )
    ( on b219 b831 )
    ( on b929 b219 )
    ( on b797 b929 )
    ( on b829 b797 )
    ( on b740 b829 )
    ( on b536 b740 )
    ( on b997 b536 )
    ( on b833 b997 )
    ( on b979 b833 )
    ( on b68 b979 )
    ( on b116 b68 )
    ( on b850 b116 )
    ( on b153 b850 )
    ( on b454 b153 )
    ( on b592 b454 )
    ( clear b592 )
  )
  ( :goal
    ( and
      ( clear b342 )
    )
  )
)
