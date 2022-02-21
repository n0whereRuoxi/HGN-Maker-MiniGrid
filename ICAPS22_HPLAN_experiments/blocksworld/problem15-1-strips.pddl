( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b940 - block
    b930 - block
    b267 - block
    b740 - block
    b391 - block
    b520 - block
    b281 - block
    b649 - block
    b208 - block
    b765 - block
    b660 - block
    b804 - block
    b301 - block
    b984 - block
    b834 - block
    b171 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b940 )
    ( on b930 b940 )
    ( on b267 b930 )
    ( on b740 b267 )
    ( on b391 b740 )
    ( on b520 b391 )
    ( on b281 b520 )
    ( on b649 b281 )
    ( on b208 b649 )
    ( on b765 b208 )
    ( on b660 b765 )
    ( on b804 b660 )
    ( on b301 b804 )
    ( on b984 b301 )
    ( on b834 b984 )
    ( on b171 b834 )
    ( clear b171 )
  )
  ( :goal
    ( and
      ( clear b940 )
    )
  )
)
