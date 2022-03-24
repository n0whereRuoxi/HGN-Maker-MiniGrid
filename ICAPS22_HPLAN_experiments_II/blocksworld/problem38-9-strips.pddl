( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b623 - block
    b914 - block
    b156 - block
    b389 - block
    b641 - block
    b157 - block
    b738 - block
    b195 - block
    b536 - block
    b629 - block
    b652 - block
    b481 - block
    b466 - block
    b693 - block
    b391 - block
    b998 - block
    b491 - block
    b688 - block
    b90 - block
    b415 - block
    b995 - block
    b915 - block
    b227 - block
    b863 - block
    b765 - block
    b441 - block
    b399 - block
    b489 - block
    b222 - block
    b520 - block
    b495 - block
    b717 - block
    b855 - block
    b767 - block
    b380 - block
    b52 - block
    b955 - block
    b888 - block
    b760 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b623 )
    ( on b914 b623 )
    ( on b156 b914 )
    ( on b389 b156 )
    ( on b641 b389 )
    ( on b157 b641 )
    ( on b738 b157 )
    ( on b195 b738 )
    ( on b536 b195 )
    ( on b629 b536 )
    ( on b652 b629 )
    ( on b481 b652 )
    ( on b466 b481 )
    ( on b693 b466 )
    ( on b391 b693 )
    ( on b998 b391 )
    ( on b491 b998 )
    ( on b688 b491 )
    ( on b90 b688 )
    ( on b415 b90 )
    ( on b995 b415 )
    ( on b915 b995 )
    ( on b227 b915 )
    ( on b863 b227 )
    ( on b765 b863 )
    ( on b441 b765 )
    ( on b399 b441 )
    ( on b489 b399 )
    ( on b222 b489 )
    ( on b520 b222 )
    ( on b495 b520 )
    ( on b717 b495 )
    ( on b855 b717 )
    ( on b767 b855 )
    ( on b380 b767 )
    ( on b52 b380 )
    ( on b955 b52 )
    ( on b888 b955 )
    ( on b760 b888 )
    ( clear b760 )
  )
  ( :goal
    ( and
      ( clear b623 )
    )
  )
)
