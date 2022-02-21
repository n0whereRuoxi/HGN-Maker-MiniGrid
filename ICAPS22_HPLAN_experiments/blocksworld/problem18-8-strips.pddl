( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b82 - block
    b221 - block
    b543 - block
    b235 - block
    b842 - block
    b208 - block
    b339 - block
    b445 - block
    b610 - block
    b827 - block
    b311 - block
    b18 - block
    b154 - block
    b285 - block
    b934 - block
    b844 - block
    b751 - block
    b807 - block
    b960 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b82 )
    ( on b221 b82 )
    ( on b543 b221 )
    ( on b235 b543 )
    ( on b842 b235 )
    ( on b208 b842 )
    ( on b339 b208 )
    ( on b445 b339 )
    ( on b610 b445 )
    ( on b827 b610 )
    ( on b311 b827 )
    ( on b18 b311 )
    ( on b154 b18 )
    ( on b285 b154 )
    ( on b934 b285 )
    ( on b844 b934 )
    ( on b751 b844 )
    ( on b807 b751 )
    ( on b960 b807 )
    ( clear b960 )
  )
  ( :goal
    ( and
      ( clear b82 )
    )
  )
)
