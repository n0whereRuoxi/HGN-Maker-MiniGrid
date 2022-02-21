( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b196 - block
    b542 - block
    b939 - block
    b440 - block
    b29 - block
    b690 - block
    b421 - block
    b100 - block
    b839 - block
    b295 - block
    b775 - block
    b72 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b196 )
    ( on b542 b196 )
    ( on b939 b542 )
    ( on b440 b939 )
    ( on b29 b440 )
    ( on b690 b29 )
    ( on b421 b690 )
    ( on b100 b421 )
    ( on b839 b100 )
    ( on b295 b839 )
    ( on b775 b295 )
    ( on b72 b775 )
    ( clear b72 )
  )
  ( :goal
    ( and
      ( clear b196 )
    )
  )
)
