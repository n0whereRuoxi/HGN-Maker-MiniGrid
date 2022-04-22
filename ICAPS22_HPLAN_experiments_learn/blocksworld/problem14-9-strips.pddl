( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b115 - block
    b310 - block
    b126 - block
    b68 - block
    b695 - block
    b160 - block
    b440 - block
    b248 - block
    b235 - block
    b694 - block
    b733 - block
    b934 - block
    b344 - block
    b603 - block
    b263 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b115 )
    ( on b310 b115 )
    ( on b126 b310 )
    ( on b68 b126 )
    ( on b695 b68 )
    ( on b160 b695 )
    ( on b440 b160 )
    ( on b248 b440 )
    ( on b235 b248 )
    ( on b694 b235 )
    ( on b733 b694 )
    ( on b934 b733 )
    ( on b344 b934 )
    ( on b603 b344 )
    ( on b263 b603 )
    ( clear b263 )
  )
  ( :goal
    ( and
      ( clear b115 )
    )
  )
)
