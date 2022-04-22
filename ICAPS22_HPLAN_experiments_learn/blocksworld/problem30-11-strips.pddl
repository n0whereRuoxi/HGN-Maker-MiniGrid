( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b259 - block
    b776 - block
    b307 - block
    b410 - block
    b13 - block
    b192 - block
    b383 - block
    b922 - block
    b635 - block
    b719 - block
    b841 - block
    b21 - block
    b778 - block
    b84 - block
    b404 - block
    b221 - block
    b863 - block
    b53 - block
    b56 - block
    b265 - block
    b496 - block
    b623 - block
    b465 - block
    b239 - block
    b751 - block
    b24 - block
    b289 - block
    b235 - block
    b91 - block
    b683 - block
    b210 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b259 )
    ( on b776 b259 )
    ( on b307 b776 )
    ( on b410 b307 )
    ( on b13 b410 )
    ( on b192 b13 )
    ( on b383 b192 )
    ( on b922 b383 )
    ( on b635 b922 )
    ( on b719 b635 )
    ( on b841 b719 )
    ( on b21 b841 )
    ( on b778 b21 )
    ( on b84 b778 )
    ( on b404 b84 )
    ( on b221 b404 )
    ( on b863 b221 )
    ( on b53 b863 )
    ( on b56 b53 )
    ( on b265 b56 )
    ( on b496 b265 )
    ( on b623 b496 )
    ( on b465 b623 )
    ( on b239 b465 )
    ( on b751 b239 )
    ( on b24 b751 )
    ( on b289 b24 )
    ( on b235 b289 )
    ( on b91 b235 )
    ( on b683 b91 )
    ( on b210 b683 )
    ( clear b210 )
  )
  ( :goal
    ( and
      ( clear b259 )
    )
  )
)
