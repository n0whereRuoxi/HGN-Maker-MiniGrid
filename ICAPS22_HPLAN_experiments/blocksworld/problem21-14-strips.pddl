( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b858 - block
    b909 - block
    b478 - block
    b77 - block
    b259 - block
    b593 - block
    b151 - block
    b383 - block
    b824 - block
    b900 - block
    b116 - block
    b289 - block
    b997 - block
    b990 - block
    b214 - block
    b188 - block
    b175 - block
    b868 - block
    b631 - block
    b167 - block
    b418 - block
    b498 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b858 )
    ( on b909 b858 )
    ( on b478 b909 )
    ( on b77 b478 )
    ( on b259 b77 )
    ( on b593 b259 )
    ( on b151 b593 )
    ( on b383 b151 )
    ( on b824 b383 )
    ( on b900 b824 )
    ( on b116 b900 )
    ( on b289 b116 )
    ( on b997 b289 )
    ( on b990 b997 )
    ( on b214 b990 )
    ( on b188 b214 )
    ( on b175 b188 )
    ( on b868 b175 )
    ( on b631 b868 )
    ( on b167 b631 )
    ( on b418 b167 )
    ( on b498 b418 )
    ( clear b498 )
  )
  ( :goal
    ( and
      ( clear b858 )
    )
  )
)
