( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b589 - block
    b736 - block
    b654 - block
    b998 - block
    b420 - block
    b984 - block
    b66 - block
    b148 - block
    b330 - block
    b387 - block
    b245 - block
    b757 - block
    b635 - block
    b333 - block
    b606 - block
    b96 - block
    b818 - block
    b173 - block
    b323 - block
    b440 - block
    b918 - block
    b989 - block
    b928 - block
    b540 - block
    b179 - block
    b316 - block
    b544 - block
    b164 - block
    b887 - block
    b309 - block
    b751 - block
    b185 - block
    b248 - block
    b779 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b589 )
    ( on b736 b589 )
    ( on b654 b736 )
    ( on b998 b654 )
    ( on b420 b998 )
    ( on b984 b420 )
    ( on b66 b984 )
    ( on b148 b66 )
    ( on b330 b148 )
    ( on b387 b330 )
    ( on b245 b387 )
    ( on b757 b245 )
    ( on b635 b757 )
    ( on b333 b635 )
    ( on b606 b333 )
    ( on b96 b606 )
    ( on b818 b96 )
    ( on b173 b818 )
    ( on b323 b173 )
    ( on b440 b323 )
    ( on b918 b440 )
    ( on b989 b918 )
    ( on b928 b989 )
    ( on b540 b928 )
    ( on b179 b540 )
    ( on b316 b179 )
    ( on b544 b316 )
    ( on b164 b544 )
    ( on b887 b164 )
    ( on b309 b887 )
    ( on b751 b309 )
    ( on b185 b751 )
    ( on b248 b185 )
    ( on b779 b248 )
    ( clear b779 )
  )
  ( :goal
    ( and
      ( clear b589 )
    )
  )
)
