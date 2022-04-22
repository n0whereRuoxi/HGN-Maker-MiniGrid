( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b449 - block
    b372 - block
    b153 - block
    b156 - block
    b395 - block
    b689 - block
    b573 - block
    b884 - block
    b150 - block
    b302 - block
    b823 - block
    b206 - block
    b82 - block
    b215 - block
    b620 - block
    b347 - block
    b783 - block
    b298 - block
    b724 - block
    b338 - block
    b333 - block
    b132 - block
    b15 - block
    b592 - block
    b297 - block
    b608 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b449 )
    ( on b372 b449 )
    ( on b153 b372 )
    ( on b156 b153 )
    ( on b395 b156 )
    ( on b689 b395 )
    ( on b573 b689 )
    ( on b884 b573 )
    ( on b150 b884 )
    ( on b302 b150 )
    ( on b823 b302 )
    ( on b206 b823 )
    ( on b82 b206 )
    ( on b215 b82 )
    ( on b620 b215 )
    ( on b347 b620 )
    ( on b783 b347 )
    ( on b298 b783 )
    ( on b724 b298 )
    ( on b338 b724 )
    ( on b333 b338 )
    ( on b132 b333 )
    ( on b15 b132 )
    ( on b592 b15 )
    ( on b297 b592 )
    ( on b608 b297 )
    ( clear b608 )
  )
  ( :goal
    ( and
      ( clear b449 )
    )
  )
)
