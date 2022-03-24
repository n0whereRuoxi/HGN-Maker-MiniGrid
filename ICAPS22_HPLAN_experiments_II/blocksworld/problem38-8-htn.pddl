( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b633 - block
    b749 - block
    b357 - block
    b417 - block
    b742 - block
    b33 - block
    b324 - block
    b267 - block
    b303 - block
    b629 - block
    b86 - block
    b370 - block
    b114 - block
    b877 - block
    b612 - block
    b662 - block
    b851 - block
    b421 - block
    b426 - block
    b27 - block
    b883 - block
    b405 - block
    b321 - block
    b845 - block
    b961 - block
    b368 - block
    b264 - block
    b653 - block
    b491 - block
    b506 - block
    b456 - block
    b601 - block
    b809 - block
    b708 - block
    b374 - block
    b406 - block
    b91 - block
    b724 - block
    b58 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b633 )
    ( on b749 b633 )
    ( on b357 b749 )
    ( on b417 b357 )
    ( on b742 b417 )
    ( on b33 b742 )
    ( on b324 b33 )
    ( on b267 b324 )
    ( on b303 b267 )
    ( on b629 b303 )
    ( on b86 b629 )
    ( on b370 b86 )
    ( on b114 b370 )
    ( on b877 b114 )
    ( on b612 b877 )
    ( on b662 b612 )
    ( on b851 b662 )
    ( on b421 b851 )
    ( on b426 b421 )
    ( on b27 b426 )
    ( on b883 b27 )
    ( on b405 b883 )
    ( on b321 b405 )
    ( on b845 b321 )
    ( on b961 b845 )
    ( on b368 b961 )
    ( on b264 b368 )
    ( on b653 b264 )
    ( on b491 b653 )
    ( on b506 b491 )
    ( on b456 b506 )
    ( on b601 b456 )
    ( on b809 b601 )
    ( on b708 b809 )
    ( on b374 b708 )
    ( on b406 b374 )
    ( on b91 b406 )
    ( on b724 b91 )
    ( on b58 b724 )
    ( clear b58 )
  )
  ( :tasks
    ( Make-38Pile b749 b357 b417 b742 b33 b324 b267 b303 b629 b86 b370 b114 b877 b612 b662 b851 b421 b426 b27 b883 b405 b321 b845 b961 b368 b264 b653 b491 b506 b456 b601 b809 b708 b374 b406 b91 b724 b58 )
  )
)
