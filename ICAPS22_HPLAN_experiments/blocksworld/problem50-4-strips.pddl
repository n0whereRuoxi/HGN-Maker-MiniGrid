( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b814 - block
    b629 - block
    b711 - block
    b895 - block
    b389 - block
    b312 - block
    b291 - block
    b996 - block
    b301 - block
    b436 - block
    b896 - block
    b636 - block
    b216 - block
    b962 - block
    b680 - block
    b484 - block
    b117 - block
    b308 - block
    b588 - block
    b319 - block
    b859 - block
    b956 - block
    b783 - block
    b247 - block
    b745 - block
    b551 - block
    b739 - block
    b435 - block
    b569 - block
    b434 - block
    b555 - block
    b131 - block
    b129 - block
    b563 - block
    b517 - block
    b268 - block
    b423 - block
    b726 - block
    b188 - block
    b512 - block
    b998 - block
    b343 - block
    b921 - block
    b567 - block
    b307 - block
    b123 - block
    b164 - block
    b293 - block
    b601 - block
    b93 - block
    b366 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b814 )
    ( on b629 b814 )
    ( on b711 b629 )
    ( on b895 b711 )
    ( on b389 b895 )
    ( on b312 b389 )
    ( on b291 b312 )
    ( on b996 b291 )
    ( on b301 b996 )
    ( on b436 b301 )
    ( on b896 b436 )
    ( on b636 b896 )
    ( on b216 b636 )
    ( on b962 b216 )
    ( on b680 b962 )
    ( on b484 b680 )
    ( on b117 b484 )
    ( on b308 b117 )
    ( on b588 b308 )
    ( on b319 b588 )
    ( on b859 b319 )
    ( on b956 b859 )
    ( on b783 b956 )
    ( on b247 b783 )
    ( on b745 b247 )
    ( on b551 b745 )
    ( on b739 b551 )
    ( on b435 b739 )
    ( on b569 b435 )
    ( on b434 b569 )
    ( on b555 b434 )
    ( on b131 b555 )
    ( on b129 b131 )
    ( on b563 b129 )
    ( on b517 b563 )
    ( on b268 b517 )
    ( on b423 b268 )
    ( on b726 b423 )
    ( on b188 b726 )
    ( on b512 b188 )
    ( on b998 b512 )
    ( on b343 b998 )
    ( on b921 b343 )
    ( on b567 b921 )
    ( on b307 b567 )
    ( on b123 b307 )
    ( on b164 b123 )
    ( on b293 b164 )
    ( on b601 b293 )
    ( on b93 b601 )
    ( on b366 b93 )
    ( clear b366 )
  )
  ( :goal
    ( and
      ( clear b814 )
    )
  )
)
