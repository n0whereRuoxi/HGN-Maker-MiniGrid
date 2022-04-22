( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b383 - block
    b821 - block
    b175 - block
    b843 - block
    b209 - block
    b478 - block
    b14 - block
    b472 - block
    b647 - block
    b20 - block
    b861 - block
    b929 - block
    b552 - block
    b829 - block
    b380 - block
    b153 - block
    b370 - block
    b480 - block
    b158 - block
    b457 - block
    b286 - block
    b462 - block
    b454 - block
    b568 - block
    b181 - block
    b400 - block
    b328 - block
    b204 - block
    b425 - block
    b863 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b383 )
    ( on b821 b383 )
    ( on b175 b821 )
    ( on b843 b175 )
    ( on b209 b843 )
    ( on b478 b209 )
    ( on b14 b478 )
    ( on b472 b14 )
    ( on b647 b472 )
    ( on b20 b647 )
    ( on b861 b20 )
    ( on b929 b861 )
    ( on b552 b929 )
    ( on b829 b552 )
    ( on b380 b829 )
    ( on b153 b380 )
    ( on b370 b153 )
    ( on b480 b370 )
    ( on b158 b480 )
    ( on b457 b158 )
    ( on b286 b457 )
    ( on b462 b286 )
    ( on b454 b462 )
    ( on b568 b454 )
    ( on b181 b568 )
    ( on b400 b181 )
    ( on b328 b400 )
    ( on b204 b328 )
    ( on b425 b204 )
    ( on b863 b425 )
    ( clear b863 )
  )
  ( :goal
    ( and
      ( clear b383 )
    )
  )
)
