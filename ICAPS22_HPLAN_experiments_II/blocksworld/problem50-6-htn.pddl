( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b82 - block
    b392 - block
    b896 - block
    b725 - block
    b689 - block
    b115 - block
    b412 - block
    b153 - block
    b337 - block
    b131 - block
    b677 - block
    b154 - block
    b66 - block
    b822 - block
    b628 - block
    b738 - block
    b63 - block
    b520 - block
    b286 - block
    b371 - block
    b142 - block
    b696 - block
    b844 - block
    b236 - block
    b440 - block
    b194 - block
    b487 - block
    b287 - block
    b266 - block
    b65 - block
    b177 - block
    b86 - block
    b888 - block
    b441 - block
    b786 - block
    b513 - block
    b242 - block
    b900 - block
    b241 - block
    b833 - block
    b607 - block
    b942 - block
    b778 - block
    b261 - block
    b641 - block
    b181 - block
    b234 - block
    b653 - block
    b854 - block
    b395 - block
    b105 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b82 )
    ( on b392 b82 )
    ( on b896 b392 )
    ( on b725 b896 )
    ( on b689 b725 )
    ( on b115 b689 )
    ( on b412 b115 )
    ( on b153 b412 )
    ( on b337 b153 )
    ( on b131 b337 )
    ( on b677 b131 )
    ( on b154 b677 )
    ( on b66 b154 )
    ( on b822 b66 )
    ( on b628 b822 )
    ( on b738 b628 )
    ( on b63 b738 )
    ( on b520 b63 )
    ( on b286 b520 )
    ( on b371 b286 )
    ( on b142 b371 )
    ( on b696 b142 )
    ( on b844 b696 )
    ( on b236 b844 )
    ( on b440 b236 )
    ( on b194 b440 )
    ( on b487 b194 )
    ( on b287 b487 )
    ( on b266 b287 )
    ( on b65 b266 )
    ( on b177 b65 )
    ( on b86 b177 )
    ( on b888 b86 )
    ( on b441 b888 )
    ( on b786 b441 )
    ( on b513 b786 )
    ( on b242 b513 )
    ( on b900 b242 )
    ( on b241 b900 )
    ( on b833 b241 )
    ( on b607 b833 )
    ( on b942 b607 )
    ( on b778 b942 )
    ( on b261 b778 )
    ( on b641 b261 )
    ( on b181 b641 )
    ( on b234 b181 )
    ( on b653 b234 )
    ( on b854 b653 )
    ( on b395 b854 )
    ( on b105 b395 )
    ( clear b105 )
  )
  ( :tasks
    ( Make-50Pile b392 b896 b725 b689 b115 b412 b153 b337 b131 b677 b154 b66 b822 b628 b738 b63 b520 b286 b371 b142 b696 b844 b236 b440 b194 b487 b287 b266 b65 b177 b86 b888 b441 b786 b513 b242 b900 b241 b833 b607 b942 b778 b261 b641 b181 b234 b653 b854 b395 b105 )
  )
)
