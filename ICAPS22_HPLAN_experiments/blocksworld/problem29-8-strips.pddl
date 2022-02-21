( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b951 - block
    b640 - block
    b289 - block
    b315 - block
    b907 - block
    b558 - block
    b608 - block
    b938 - block
    b551 - block
    b421 - block
    b665 - block
    b733 - block
    b586 - block
    b392 - block
    b178 - block
    b291 - block
    b753 - block
    b204 - block
    b843 - block
    b86 - block
    b167 - block
    b172 - block
    b831 - block
    b615 - block
    b820 - block
    b175 - block
    b341 - block
    b123 - block
    b493 - block
    b284 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b951 )
    ( on b640 b951 )
    ( on b289 b640 )
    ( on b315 b289 )
    ( on b907 b315 )
    ( on b558 b907 )
    ( on b608 b558 )
    ( on b938 b608 )
    ( on b551 b938 )
    ( on b421 b551 )
    ( on b665 b421 )
    ( on b733 b665 )
    ( on b586 b733 )
    ( on b392 b586 )
    ( on b178 b392 )
    ( on b291 b178 )
    ( on b753 b291 )
    ( on b204 b753 )
    ( on b843 b204 )
    ( on b86 b843 )
    ( on b167 b86 )
    ( on b172 b167 )
    ( on b831 b172 )
    ( on b615 b831 )
    ( on b820 b615 )
    ( on b175 b820 )
    ( on b341 b175 )
    ( on b123 b341 )
    ( on b493 b123 )
    ( on b284 b493 )
    ( clear b284 )
  )
  ( :goal
    ( and
      ( clear b951 )
    )
  )
)
