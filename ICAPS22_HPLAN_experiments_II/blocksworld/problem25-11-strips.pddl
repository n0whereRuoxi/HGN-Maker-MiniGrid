( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b600 - block
    b598 - block
    b458 - block
    b608 - block
    b435 - block
    b7 - block
    b722 - block
    b355 - block
    b785 - block
    b719 - block
    b326 - block
    b321 - block
    b655 - block
    b850 - block
    b697 - block
    b163 - block
    b252 - block
    b272 - block
    b980 - block
    b828 - block
    b671 - block
    b999 - block
    b368 - block
    b340 - block
    b265 - block
    b107 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b600 )
    ( on b598 b600 )
    ( on b458 b598 )
    ( on b608 b458 )
    ( on b435 b608 )
    ( on b7 b435 )
    ( on b722 b7 )
    ( on b355 b722 )
    ( on b785 b355 )
    ( on b719 b785 )
    ( on b326 b719 )
    ( on b321 b326 )
    ( on b655 b321 )
    ( on b850 b655 )
    ( on b697 b850 )
    ( on b163 b697 )
    ( on b252 b163 )
    ( on b272 b252 )
    ( on b980 b272 )
    ( on b828 b980 )
    ( on b671 b828 )
    ( on b999 b671 )
    ( on b368 b999 )
    ( on b340 b368 )
    ( on b265 b340 )
    ( on b107 b265 )
    ( clear b107 )
  )
  ( :goal
    ( and
      ( clear b600 )
    )
  )
)
