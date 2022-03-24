( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b206 - block
    b297 - block
    b910 - block
    b101 - block
    b787 - block
    b436 - block
    b935 - block
    b60 - block
    b584 - block
    b836 - block
    b456 - block
    b170 - block
    b863 - block
    b214 - block
    b302 - block
    b11 - block
    b157 - block
    b439 - block
    b571 - block
    b253 - block
    b974 - block
    b703 - block
    b823 - block
    b626 - block
    b550 - block
    b504 - block
    b872 - block
    b484 - block
    b178 - block
    b509 - block
    b387 - block
    b241 - block
    b473 - block
    b979 - block
    b856 - block
    b771 - block
    b885 - block
    b694 - block
    b415 - block
    b191 - block
    b650 - block
    b331 - block
    b850 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b206 )
    ( on b297 b206 )
    ( on b910 b297 )
    ( on b101 b910 )
    ( on b787 b101 )
    ( on b436 b787 )
    ( on b935 b436 )
    ( on b60 b935 )
    ( on b584 b60 )
    ( on b836 b584 )
    ( on b456 b836 )
    ( on b170 b456 )
    ( on b863 b170 )
    ( on b214 b863 )
    ( on b302 b214 )
    ( on b11 b302 )
    ( on b157 b11 )
    ( on b439 b157 )
    ( on b571 b439 )
    ( on b253 b571 )
    ( on b974 b253 )
    ( on b703 b974 )
    ( on b823 b703 )
    ( on b626 b823 )
    ( on b550 b626 )
    ( on b504 b550 )
    ( on b872 b504 )
    ( on b484 b872 )
    ( on b178 b484 )
    ( on b509 b178 )
    ( on b387 b509 )
    ( on b241 b387 )
    ( on b473 b241 )
    ( on b979 b473 )
    ( on b856 b979 )
    ( on b771 b856 )
    ( on b885 b771 )
    ( on b694 b885 )
    ( on b415 b694 )
    ( on b191 b415 )
    ( on b650 b191 )
    ( on b331 b650 )
    ( on b850 b331 )
    ( clear b850 )
  )
  ( :tasks
    ( Make-42Pile b297 b910 b101 b787 b436 b935 b60 b584 b836 b456 b170 b863 b214 b302 b11 b157 b439 b571 b253 b974 b703 b823 b626 b550 b504 b872 b484 b178 b509 b387 b241 b473 b979 b856 b771 b885 b694 b415 b191 b650 b331 b850 )
  )
)
