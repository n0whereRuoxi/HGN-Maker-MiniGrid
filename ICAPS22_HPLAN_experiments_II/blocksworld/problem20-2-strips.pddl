( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b25 - block
    b981 - block
    b157 - block
    b594 - block
    b716 - block
    b849 - block
    b195 - block
    b800 - block
    b607 - block
    b497 - block
    b795 - block
    b700 - block
    b970 - block
    b341 - block
    b821 - block
    b873 - block
    b979 - block
    b946 - block
    b260 - block
    b51 - block
    b392 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b25 )
    ( on b981 b25 )
    ( on b157 b981 )
    ( on b594 b157 )
    ( on b716 b594 )
    ( on b849 b716 )
    ( on b195 b849 )
    ( on b800 b195 )
    ( on b607 b800 )
    ( on b497 b607 )
    ( on b795 b497 )
    ( on b700 b795 )
    ( on b970 b700 )
    ( on b341 b970 )
    ( on b821 b341 )
    ( on b873 b821 )
    ( on b979 b873 )
    ( on b946 b979 )
    ( on b260 b946 )
    ( on b51 b260 )
    ( on b392 b51 )
    ( clear b392 )
  )
  ( :goal
    ( and
      ( clear b25 )
    )
  )
)
