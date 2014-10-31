/*
 * jQuery Mobile Framework : plugin to provide a date and time picker.
 * Copyright (c) JTSage
 * CC 3.0 Attribution.  May be relicensed without permission/notifcation.
 * https://github.com/jtsage/jquery-mobile-datebox
 *
 * Translation by: Alexander Zolotko <azolotko@gmail.com>
 *
 */

jQuery.extend(jQuery.mobile.datebox.prototype.options.lang, {
	'ru': {
		setDateButtonLabel: "Установить Дату",
		setTimeButtonLabel: "Установить Время",
		setDurationButtonLabel: "Установить Продолжительность",
		calTodayButtonLabel: "Сегодня",
		titleDateDialogLabel: "Выбрать дату",
		titleTimeDialogLabel: "Выбрать время",
		daysOfWeek: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"],
		daysOfWeekShort: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
		monthsOfYear: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
		monthsOfYearShort: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"],
		durationLabel: ["Дни", "Часы", "Минуты", "Секунды"],
		durationDays: ["День", "Дни"],
		tooltip: "Открытый выбор даты",
		nextMonth: "След",
		prevMonth: "Пред",
		timeFormat: 24,
		headerFormat: '%A, %B %-d, %Y',
		dateFieldOrder: ['d','m','y'],
		timeFieldOrder: ['h', 'i', 'a'],
		slideFieldOrder: ['y', 'm', 'd'],
		dateFormat: "%d.%m.%Y",
		useArabicIndic: false,
		isRTL: false,
		calStartDay: 0,
		clearButton: "Ясно",
		durationOrder: ['d', 'h', 'i', 's'],
		meridiem: ["AM", "PM"],
		timeOutput: "%k:%M",
		durationFormat: "%Dd %DA, %Dl:%DM:%DS",
		calDateListLabel: "Другие даты",
		calHeaderFormat: "%B %Y",
		calTomorrowButtonLabel: "Перейти на завтра"
	}
});
jQuery.extend(jQuery.mobile.datebox.prototype.options, {
	useLang: 'ru'
});

