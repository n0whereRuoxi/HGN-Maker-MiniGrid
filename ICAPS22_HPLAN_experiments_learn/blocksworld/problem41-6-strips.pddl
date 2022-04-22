( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b738 - block
    b380 - block
    b866 - block
    b706 - block
    b209 - block
    b995 - block
    b845 - block
    b695 - block
    b487 - block
    b578 - block
    b489 - block
    b123 - block
    b405 - block
    b360 - block
    b802 - block
    b635 - block
    b964 - block
    b810 - block
    b34 - block
    b736 - block
    b462 - block
    b11 - block
    b167 - block
    b685 - block
    b22 - block
    b727 - block
    b424 - block
    b825 - block
    b358 - block
    b571 - block
    b225 - block
    b296 - block
    b398 - block
    b945 - block
    b778 - block
    b716 - block
    b213 - block
    b39 - block
    b985 - block
    b291 - block
    b399 - block
    b748 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b738 )
    ( on b380 b738 )
    ( on b866 b380 )
    ( on b706 b866 )
    ( on b209 b706 )
    ( on b995 b209 )
    ( on b845 b995 )
    ( on b695 b845 )
    ( on b487 b695 )
    ( on b578 b487 )
    ( on b489 b578 )
    ( on b123 b489 )
    ( on b405 b123 )
    ( on b360 b405 )
    ( on b802 b360 )
    ( on b635 b802 )
    ( on b964 b635 )
    ( on b810 b964 )
    ( on b34 b810 )
    ( on b736 b34 )
    ( on b462 b736 )
    ( on b11 b462 )
    ( on b167 b11 )
    ( on b685 b167 )
    ( on b22 b685 )
    ( on b727 b22 )
    ( on b424 b727 )
    ( on b825 b424 )
    ( on b358 b825 )
    ( on b571 b358 )
    ( on b225 b571 )
    ( on b296 b225 )
    ( on b398 b296 )
    ( on b945 b398 )
    ( on b778 b945 )
    ( on b716 b778 )
    ( on b213 b716 )
    ( on b39 b213 )
    ( on b985 b39 )
    ( on b291 b985 )
    ( on b399 b291 )
    ( on b748 b399 )
    ( clear b748 )
  )
  ( :goal
    ( and
      ( clear b738 )
    )
  )
)
