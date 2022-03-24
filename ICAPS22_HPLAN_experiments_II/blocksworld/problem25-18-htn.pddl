( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b239 - block
    b365 - block
    b225 - block
    b292 - block
    b309 - block
    b925 - block
    b88 - block
    b589 - block
    b633 - block
    b187 - block
    b473 - block
    b859 - block
    b839 - block
    b616 - block
    b899 - block
    b746 - block
    b654 - block
    b323 - block
    b952 - block
    b85 - block
    b128 - block
    b326 - block
    b449 - block
    b255 - block
    b460 - block
    b310 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b239 )
    ( on b365 b239 )
    ( on b225 b365 )
    ( on b292 b225 )
    ( on b309 b292 )
    ( on b925 b309 )
    ( on b88 b925 )
    ( on b589 b88 )
    ( on b633 b589 )
    ( on b187 b633 )
    ( on b473 b187 )
    ( on b859 b473 )
    ( on b839 b859 )
    ( on b616 b839 )
    ( on b899 b616 )
    ( on b746 b899 )
    ( on b654 b746 )
    ( on b323 b654 )
    ( on b952 b323 )
    ( on b85 b952 )
    ( on b128 b85 )
    ( on b326 b128 )
    ( on b449 b326 )
    ( on b255 b449 )
    ( on b460 b255 )
    ( on b310 b460 )
    ( clear b310 )
  )
  ( :tasks
    ( Make-25Pile b365 b225 b292 b309 b925 b88 b589 b633 b187 b473 b859 b839 b616 b899 b746 b654 b323 b952 b85 b128 b326 b449 b255 b460 b310 )
  )
)
