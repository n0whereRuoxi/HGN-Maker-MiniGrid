( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b305 - block
    b393 - block
    b717 - block
    b75 - block
    b98 - block
    b139 - block
    b173 - block
    b392 - block
    b758 - block
    b867 - block
    b500 - block
    b199 - block
    b165 - block
    b316 - block
    b262 - block
    b942 - block
    b130 - block
    b848 - block
    b913 - block
    b456 - block
    b194 - block
    b405 - block
    b963 - block
    b688 - block
    b604 - block
    b221 - block
    b135 - block
    b597 - block
    b764 - block
    b509 - block
    b419 - block
    b113 - block
    b625 - block
    b151 - block
    b683 - block
    b71 - block
    b898 - block
    b88 - block
    b211 - block
    b286 - block
    b727 - block
    b175 - block
    b443 - block
    b329 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b305 )
    ( on b393 b305 )
    ( on b717 b393 )
    ( on b75 b717 )
    ( on b98 b75 )
    ( on b139 b98 )
    ( on b173 b139 )
    ( on b392 b173 )
    ( on b758 b392 )
    ( on b867 b758 )
    ( on b500 b867 )
    ( on b199 b500 )
    ( on b165 b199 )
    ( on b316 b165 )
    ( on b262 b316 )
    ( on b942 b262 )
    ( on b130 b942 )
    ( on b848 b130 )
    ( on b913 b848 )
    ( on b456 b913 )
    ( on b194 b456 )
    ( on b405 b194 )
    ( on b963 b405 )
    ( on b688 b963 )
    ( on b604 b688 )
    ( on b221 b604 )
    ( on b135 b221 )
    ( on b597 b135 )
    ( on b764 b597 )
    ( on b509 b764 )
    ( on b419 b509 )
    ( on b113 b419 )
    ( on b625 b113 )
    ( on b151 b625 )
    ( on b683 b151 )
    ( on b71 b683 )
    ( on b898 b71 )
    ( on b88 b898 )
    ( on b211 b88 )
    ( on b286 b211 )
    ( on b727 b286 )
    ( on b175 b727 )
    ( on b443 b175 )
    ( on b329 b443 )
    ( clear b329 )
  )
  ( :goal
    ( and
      ( clear b305 )
    )
  )
)
