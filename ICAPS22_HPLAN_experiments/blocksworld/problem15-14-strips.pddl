( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b768 - block
    b763 - block
    b136 - block
    b645 - block
    b745 - block
    b163 - block
    b762 - block
    b160 - block
    b513 - block
    b295 - block
    b322 - block
    b774 - block
    b204 - block
    b299 - block
    b420 - block
    b670 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b768 )
    ( on b763 b768 )
    ( on b136 b763 )
    ( on b645 b136 )
    ( on b745 b645 )
    ( on b163 b745 )
    ( on b762 b163 )
    ( on b160 b762 )
    ( on b513 b160 )
    ( on b295 b513 )
    ( on b322 b295 )
    ( on b774 b322 )
    ( on b204 b774 )
    ( on b299 b204 )
    ( on b420 b299 )
    ( on b670 b420 )
    ( clear b670 )
  )
  ( :goal
    ( and
      ( clear b768 )
    )
  )
)
