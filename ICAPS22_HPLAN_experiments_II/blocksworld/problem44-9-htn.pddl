( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b540 - block
    b424 - block
    b440 - block
    b891 - block
    b217 - block
    b476 - block
    b285 - block
    b640 - block
    b312 - block
    b434 - block
    b945 - block
    b855 - block
    b801 - block
    b357 - block
    b935 - block
    b832 - block
    b888 - block
    b351 - block
    b699 - block
    b857 - block
    b532 - block
    b479 - block
    b302 - block
    b636 - block
    b35 - block
    b738 - block
    b277 - block
    b336 - block
    b350 - block
    b893 - block
    b614 - block
    b981 - block
    b409 - block
    b265 - block
    b27 - block
    b326 - block
    b100 - block
    b426 - block
    b472 - block
    b206 - block
    b48 - block
    b491 - block
    b353 - block
    b722 - block
    b370 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b540 )
    ( on b424 b540 )
    ( on b440 b424 )
    ( on b891 b440 )
    ( on b217 b891 )
    ( on b476 b217 )
    ( on b285 b476 )
    ( on b640 b285 )
    ( on b312 b640 )
    ( on b434 b312 )
    ( on b945 b434 )
    ( on b855 b945 )
    ( on b801 b855 )
    ( on b357 b801 )
    ( on b935 b357 )
    ( on b832 b935 )
    ( on b888 b832 )
    ( on b351 b888 )
    ( on b699 b351 )
    ( on b857 b699 )
    ( on b532 b857 )
    ( on b479 b532 )
    ( on b302 b479 )
    ( on b636 b302 )
    ( on b35 b636 )
    ( on b738 b35 )
    ( on b277 b738 )
    ( on b336 b277 )
    ( on b350 b336 )
    ( on b893 b350 )
    ( on b614 b893 )
    ( on b981 b614 )
    ( on b409 b981 )
    ( on b265 b409 )
    ( on b27 b265 )
    ( on b326 b27 )
    ( on b100 b326 )
    ( on b426 b100 )
    ( on b472 b426 )
    ( on b206 b472 )
    ( on b48 b206 )
    ( on b491 b48 )
    ( on b353 b491 )
    ( on b722 b353 )
    ( on b370 b722 )
    ( clear b370 )
  )
  ( :tasks
    ( Make-44Pile b424 b440 b891 b217 b476 b285 b640 b312 b434 b945 b855 b801 b357 b935 b832 b888 b351 b699 b857 b532 b479 b302 b636 b35 b738 b277 b336 b350 b893 b614 b981 b409 b265 b27 b326 b100 b426 b472 b206 b48 b491 b353 b722 b370 )
  )
)
