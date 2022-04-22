( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b178 - block
    b517 - block
    b863 - block
    b477 - block
    b463 - block
    b441 - block
    b616 - block
    b984 - block
    b478 - block
    b981 - block
    b31 - block
    b243 - block
    b655 - block
    b82 - block
    b934 - block
    b154 - block
    b499 - block
    b765 - block
    b638 - block
    b995 - block
    b455 - block
    b634 - block
    b345 - block
    b166 - block
    b868 - block
    b301 - block
    b870 - block
    b963 - block
    b310 - block
    b458 - block
    b635 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b178 )
    ( on b517 b178 )
    ( on b863 b517 )
    ( on b477 b863 )
    ( on b463 b477 )
    ( on b441 b463 )
    ( on b616 b441 )
    ( on b984 b616 )
    ( on b478 b984 )
    ( on b981 b478 )
    ( on b31 b981 )
    ( on b243 b31 )
    ( on b655 b243 )
    ( on b82 b655 )
    ( on b934 b82 )
    ( on b154 b934 )
    ( on b499 b154 )
    ( on b765 b499 )
    ( on b638 b765 )
    ( on b995 b638 )
    ( on b455 b995 )
    ( on b634 b455 )
    ( on b345 b634 )
    ( on b166 b345 )
    ( on b868 b166 )
    ( on b301 b868 )
    ( on b870 b301 )
    ( on b963 b870 )
    ( on b310 b963 )
    ( on b458 b310 )
    ( on b635 b458 )
    ( clear b635 )
  )
  ( :goal
    ( and
      ( clear b178 )
    )
  )
)
